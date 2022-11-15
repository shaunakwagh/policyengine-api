CREATE TABLE IF NOT EXISTS household (
    id INTEGER PRIMARY KEY,
    country VARCHAR(3) NOT NULL,
    label VARCHAR(255) NOT NULL,
    version VARCHAR(255) NOT NULL,
    household_json JSONB NOT NULL,
    household_hash VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS computed_household (
    household_id INT NOT NULL,
    policy_id INT NOT NULL,
    country VARCHAR(3) NOT NULL,
    version VARCHAR(255) NOT NULL,
    computed_household_json JSONB NOT NULL,
    PRIMARY KEY (household_id, policy_id, country)
);

CREATE TABLE IF NOT EXISTS policy (
    id INTEGER PRIMARY KEY,
    country VARCHAR(3) NOT NULL,
    label VARCHAR(255) NOT NULL,
    version VARCHAR(255) NOT NULL,
    policy_json JSONB NOT NULL,
    policy_hash VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS economy (
    household_id INT NOT NULL,
    policy_id INT NOT NULL,
    country VARCHAR(3) NOT NULL,
    version VARCHAR(255) NOT NULL,
    economy_json JSONB NOT NULL,
    PRIMARY KEY (household_id, policy_id, country)
);

-- The policy table should start with one policy: current law.

INSERT INTO policy VALUES (1, "global", "Current law", "0.1.0", "{}", "current-law")
ON CONFLICT DO NOTHING;
